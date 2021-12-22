require 'redis'

class PubSub
  def initialize
    @redis = Redis.new
    @subscriptions = {}
  end

  def publish(chan, data)
    @redis.publish(chan, data)
  end

  def subscribe(chan, &block)
    @subscriptions[chan] ||= []
    @subscriptions[chan] << Thread.new do
      Redis.new.subscribe(chan) do |on|
        on.message do |c, data|
          block.call(data)
        end
      end
    end
  end

  def unsubscribe(chan)
    @redis.unsubscribe(chan)
    Array(@subscriptions[chan]).each do |thread|
      thread.exit
    end
    @subscriptions.delete(chan)
  end
end
