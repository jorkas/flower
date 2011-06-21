class Flower::Command
  def self.delegate_command(command, flower)
    subclasses.each do |subclass|
      subclass.parse(command, flower)
    end
  end
  
  private
  def self.subclasses
    @subclasses ||= Class.constants.find_all do |klass|
      klass != klass.upcase ? self > (Object.const_get(klass)) : nil
    end.map{ |klass| Object.const_get(klass) }
  end
end