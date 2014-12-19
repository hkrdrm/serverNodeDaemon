require 'ffi-rzmq'
require 'json'

def getStatus
  "Is ok fo sho"
end

def createServer
end

def deleteServer
end

puts "Starting node Server..."

context = ZMQ::Context.new

socket = context.socket(ZMQ::REP)
socket.bind("tcp://*:5555")

loop do
  request = ''
  socket.recv_string(request)

  puts "Received request. Data: #{request.inspect}"
  req_json = JSON.parse(request)
  req_fn   = req_json["fn"]

  if req_fn == "getStatus"
    socket.send_string(getStatus)
  else
    raise NotImplementedError
  end
end
