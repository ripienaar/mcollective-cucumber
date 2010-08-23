metadata    :name        => "Echo Agent",
            :description => "Simple Echo Agent",
            :author      => "Me",
            :license     => "Apache v.2",
            :version     => "1.0",
            :url         => "http://www.devco.net/",
            :timeout     => 2

action "echo", :description => "Echo's back a string" do
    display :always

    input :msg,
        :prompt      => "Message",
        :description => "The message to send to the node",
        :type        => :string,
        :validation  => '^.+$',
        :optional    => false,
        :maxlength    => 90

    output :msg,
           :description => "The message received",
           :display_as => "Message"

    output :time,
           :description => "The time the message was received",
           :display_as => "Time"
end
