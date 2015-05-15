require 'langtastic/version'
require 'net/http'

module Langtastic
  extend self

  def subtags
    raw_subtags.map do |subtag|
      @last_field = []
      Hash[
        subtag.map do |field|
          if field.split(': ').size > 1
            @this_field = field.split(': ')
            if duplicate_field?
              @last_field[1] += ", #{@this_field[1]}"
              nil
            else
              @last_field = @this_field
            end
          else
            @last_field[1] += field
            nil
          end
        end.compact
      ]
    end
  end

  private

  def duplicate_field?
    @this_field[0] == @last_field[0]
  end

  def raw_subtags
    data.split('%%').map(&:strip).map { |subtag| subtag.split("\n") }
  end

  def data
    Net::HTTP.get('www.iana.org', '/assignments/language-subtag-registry/language-subtag-registry')
  end
end
