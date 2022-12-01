require 'kafka'
    kafka = Kafka.new(["localhost:9092"])
    kafka.deliver_message("Hello World!", topic: "test-topic")