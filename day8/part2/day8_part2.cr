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
      break [false, accu] if seen_pcs.size == seen_pcs_size

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

      return [true, accu] if pc >= @program.size
    end
  end
end

class Day8Part2
  @filename : String

  def initialize(@filename); end

  def run!
    original_program = [] of Instruction

    File.read_lines(@filename).each do |line|
      operation, value = line.split(" ")
      original_program << Instruction.new(operation, value.to_i)
    end

    jmps = [] of Int32
    original_program.each_with_index do |line, idx|
      jmps << idx if line.operation == "jmp"
    end

    program = original_program

    loop do
      success, accu = VM.new(program).run!

      if success
        break accu
      else
        if jmps.empty?
          break "fuck"
        end
        index = jmps.shift
        instruction_to_mod = original_program[index].dup
        program = original_program.dup
        program[index] = Instruction.new("nop", instruction_to_mod.value)
      end
    end
  end
end
