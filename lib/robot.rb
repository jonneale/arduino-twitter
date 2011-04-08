class Robot
  
  FORWARD = 'f'
  BACKWARD = 'b'
  LEFT = 'l'
  RIGHT = 'r'
  DANCE = 'd'
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
  
  def forward()
    @sp.write(FORWARD)
    
    #
  end

  def backward()
    @sp.write(BACKWARD)
  end

  def left()
    @sp.write(LEFT)
  end

  def right()
    @sp.write(RIGHT)
  end
  
  def dance()
    @sp.write(DANCE)
  end

  def hard_right()
    @sp.write(HARDRIGHT)  
  end

  def hard_left()
    @sp.write(HARDLEFT)
  end
end