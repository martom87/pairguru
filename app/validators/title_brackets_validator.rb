class TitleBracketsValidator < ActiveModel::Validator

  def validate(record)
    if brackets_are_empty?(record.title)
      record.errors[:title] << 'White spaces in brackets'
    elsif brackets_are_unbalanced?(record.title)
      record.errors[:title] << 'Title has unbalanced brackets'
    end
  end

  private

  def brackets_are_empty?(title)
    possible_pairs = define_pairs(as: :array).call
    possible_pairs.any? {|bracket_pair| title.include?(bracket_pair)}
  end

  def brackets_are_unbalanced?(title)
    possible_pairs = define_pairs(as: :hash).call
    brackets_stack = []
    title.each_char do |char|
      if possible_pairs.keys.any? {|bracket| bracket == char}
        brackets_stack << char
      elsif possible_pairs.values.any? {|bracket| bracket == char}
        char != possible_pairs.dig(brackets_stack.last) ? (return true) : brackets_stack.pop
      end
    end
    brackets_stack.any?
  end

  def define_pairs(as:)
    brackets = '()[]{}'.split('')
    pairs_array = Proc.new {brackets.combination(2).map {|br| br.join}}
    pairs_hash = Proc.new {Hash[brackets.each_slice(2).map {|e| e}]}
    return pairs_array if as == :array
    return pairs_hash if as == :hash
  end

end


