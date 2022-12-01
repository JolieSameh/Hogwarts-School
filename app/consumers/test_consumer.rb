class TestConsumer < Racecar::Consumer
  subscribes_to "test-topic"

  def process(message)
    puts "Received message: #{message.value}"
    rescue JSON::ParserError => e
      puts "Failed to process message in #{message.topic}/#{message.partition} at offset #{message.offset}: #{e}"
   
  end
end
 