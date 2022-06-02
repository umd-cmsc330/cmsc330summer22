class PhoneBook
    def initialize
        @phonebook = {}
    end

    def undoFormatting(number)
        if number.length == 12
            number_chars = number.chars.reverse()
            new_number = 0
            j = 0
            for num in number_chars do
                if num != "-"
                    new_number += num.to_i * (10 ** j)
                    j += 1
                end
            end
            return new_number
        else
            return 0
        end
    end

    def ensureFormatting(number)
        if number.length == 12
            number_chars = number.chars
            for i in 0..11
                if i == 3 || i == 7
                    if number_chars[i] != "-"
                      return false
                    end
                elsif number_chars[i] != "0" && number_chars[i].to_i == 0
                    return false
                end
            end
            return true
        else
            return false
        end
    end

    def add(name, number, is_listed)
        if ensureFormatting(number) && !@phonebook.key?(name)
            unformatted_num = undoFormatting(number)
            if !is_listed
                @phonebook[name] = unformatted_num / 10000000
                return true
            elsif !@phonebook.value?(unformatted_num)
                @phonebook[name] = unformatted_num
                return true
            end
        end
        return false
    end

    def lookup(name)
        if @phonebook.key?(name) && @phonebook[name] >= 1000
            return @phonebook[name].to_s.insert(3, '-').insert(-5, '-')
        end
        return nil
    end

    def lookupByNum(number)
        if ensureFormatting(number)
            unformatted_num = undoFormatting(number)
            @phonebook.each{|name, num|
                if num == unformatted_num
                    return name
                end
            }
        end
        return nil
    end

    def getAcFromNum(number)
        if number < 1000
            return number
        else
            return number / 10000000
        end
    end

    def namesByAc(areacode)
        names = []
        @phonebook.each{|name, num|
            if getAcFromNum(num) == areacode.to_i
                names.push(name)
            end
        }
        return names
    end

    private :undoFormatting, :ensureFormatting, :getAcFromNum

end
