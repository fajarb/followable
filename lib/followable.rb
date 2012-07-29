require "followable/version"
require "redis"

module Followable
  extend ActiveSupport::Concern
  
  # follow an object
  def follow!(object)
    $redis.multi do
      $redis.sadd(self.redis_key(:following, object), object.id)
      $redis.sadd(object.redis_key(:followers, object), self.id)
    end
  end
  
  # unfollow an object
  def unfollow!(object)
    $redis.multi do
      $redis.srem(self.redis_key(:following, object), user.id)
      $redis.srem(user.redis_key(:followers, object), self.id)
    end
  end
  
  # objects that self follows
  def followers
    object_ids = $redis.smembers(self.redis_key(:followers, self))
    self.class.where(:id => object_ids)
  end

  # objects that follow self
  def following
    object_ids = $redis.smembers(self.redis_key(:following, self))
    self.class.where(:id => object_ids)
  end

  # objects who follow and are being followed by self
  # def friends
  #   user_ids = $redis.sinter(self.redis_key(:following), self.redis_key(:followers))
  #   User.where(:id => user_ids)
  # end

  # does the object follow self
  def followed_by?(object)
    $redis.sismember(self.redis_key(:followers, object), object.id)
  end
  
  # does self follow user
  def following?(object)
    $redis.sismember(self.redis_key(:following, object), object.id)
  end

  # number of followers
  def followers_count
    $redis.scard(self.redis_key(:followers, self))
  end

  # number of users being followed
  def following_count
    $redis.scard(self.redis_key(:following, self))
  end
  
  # helper method to generate redis keys
  def redis_key(str, object)
    "user:#{self.id}:#{str}:#{object.class.name.downcase}"
  end
end