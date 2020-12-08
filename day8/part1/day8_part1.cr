class Instruction
  @operation : String
  @value : Int32
  getter :operation, :value

  def initialize(@operation, @value); end
end

class VM
  @program : Array(Instruction)

  def initialize(@program); end

  def run!
    seen_pcs = Set(Int32).new
    pc = 0
    accu = 0

    loop do
      instruction = @program[pc]

      seen_pcs_size = seen_pcs.size
      seen_pcs << pc
      break accu if seen_pcs.size == seen_pcs_size

      case instruction.operation
      when "nop"
        pc += 1
      when "acc"
        accu += instruction.value
        pc += 1
      when "jmp"
        pc += instruction.value
      else
        raise ArgumentError.new("unknown opcode #{instruction.operation}")
      end
    end
  end
end

class Day8Part1
  @filename : String

  def initialize(@filename); end

  def run!
    program = [] of Instruction

    File.read_lines(@filename).each do |line|
      operation, value = line.split(" ")
      program << Instruction.new(operation, value.to_i)
    end

    VM.new(program).run!
  end
end
