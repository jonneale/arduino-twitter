require 'serialport'

class Robot
  
  FORWARD = 'f'
  BACKWARD = 'b'
  LEFT = 'l'
  RIGHT = 'r'
  HARDLEFT = 'a'
  HARDRIGHT = 'c'
  
  def initialize
    port_str = "/dev/tty.usbmodemfa141"
    baud_rate = 9600  
    data_bits = 8  
    stop_bits = 1
    parity = SerialPort::NONE  

    @sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
  end
  
  def move_forward()
    @sp.write(FORWARD)
  end

  def move_backward()
    @sp.write(BACKWARD)
  end

  def turn_left()
    @sp.write(LEFT)
  end

  def turn_right()
    @sp.write(RIGHT)
  end

  def hard_right()
    @sp.write(HARDRIGHT)  
  end

  def hard_left()
    @sp.write(HARDLEFT)
  end
end