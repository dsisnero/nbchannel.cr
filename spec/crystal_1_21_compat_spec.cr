require "./spec_helper"

describe NBChannel do
  it "compiles a blocking receive path on Crystal 1.21" do
    channel = NBChannel(Int32).new
    spawned = false

    spawn do
      spawned = true
      channel.receive?
    end

    Fiber.yield
    spawned.should be_true
  end
end
