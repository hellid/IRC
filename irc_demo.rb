require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "JessePinkman"
channel = "#bitmaker"
greeting_prefix = "privmsg #bitmaker :"
greetings = ["hello", "hi", "hola", "yo", "Knocks" "cook"]

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BhelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"

#Hello Bot!
until irc_server.eof? do
	msg = irc_server.gets.downcase
	puts msg
	
	wasGreeted = false
	greetings.each { |g| wasGreeted = true if msg.include? g }
	
	if msg.include? greeting_prefix and wasGreeted
	response = "i have feelings u know"
	irc_server.puts "PRIVMSG #{channel} :#{response}"
	end
	
end

