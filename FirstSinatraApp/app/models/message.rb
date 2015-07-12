class Message < ActiveRecord::Base

end


Message.create title: "First message", author: "Someone", content: "KV is so cool"
Message.create title: "Second message", author: "Someone else", content: "So is fridge"
Message.create title: "Third message", author: "Nobody", content: "..."
