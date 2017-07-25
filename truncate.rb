require 'pry-state'

def truncate(input)
  checker = Array.new(input.length, '')
  p input
  results = []
  round = 0
  until input.empty? || round == 10
    input.each_with_index do |word, i|
      if letter_to_add = word[round]
        checker[i] += word[round]
      else
        results.push(word)
        delete_index = input.index(word)
        checker[delete_index] = nil
        input[delete_index] = nil
      end
    end
    checker.compact!
    input.compact!
    uniques = checker.select{|element| checker.count(element) == 1 }
    if !uniques.empty?
      uniques.each do |string|
        delete_index = checker.index(string)
        checker.delete_at(delete_index)
        input.delete_at(delete_index)
      end
    end
    results += uniques
    round += 1
  end
  p results
end

input =   ['ald', 'a', 'ab', 'ac', 'aca', 'acr', 'alabama', 'bellow']
truncate(input)

# input =   ['ald', 'a', 'ab', 'ac', 'aca', 'acr', 'alabama', 'bellow']
# #1 take first letter of each word and put into checker
# input =   ['ald', 'a', 'ab', 'ac', 'aca', 'acr', 'alabama', 'bellow']
# checker = ['a'  , 'a',  'a',  'a',   'a',   'a',       'a',      'b']
# #2 after completetion, check each for uniqueness
# #3 if its uniqe, remove it and its corresponding input and add to result ( b is unique)
# input =   ['ald', 'a', 'ab', 'ac', 'aca', 'acr', 'alabama']
# checker = ['a'  , 'a',  'a',   'a',   'a',   'a',      'a']
# results = ['b']
# #4 take nextletter of each word and put into checker
# #5 while checking, if return is null on 2nd letter, remove word from input and checker and add to results
# input =   ['ald', 'ab', 'ac', 'aca', 'acr', 'alabama']
# checker = ['al'  ,'ab', 'ac',  'ac',  'ac',     'al' ]
# results = ['b', 'a']
# #6 repeat steps 2 through 5 untill input is empty
