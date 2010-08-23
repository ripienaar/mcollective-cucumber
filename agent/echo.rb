module MCollective
    module Agent
        class Echo<RPC::Agent
            metadata    :name        => "Echo Agent",
                        :description => "Simple Echo Agent",
                        :author      => "Me",
                        :license     => "Apache v.2",
                        :version     => "1.0",
                        :url         => "http://www.devco.net/",
                        :timeout     => 2

            action "echo" do
                validate :msg, String

                reply.fail! "Boom!" if rand(10) % 2 == 0

                reply[:msg] = request[:msg]
                reply[:time] = Time.now.to_s
            end
        end
    end
end
