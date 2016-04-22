require 'csv'
require_relative '../../config/environments/init'

class LinkImporter
  def self.clean
    csv = CSV.new(File.open('urls.csv'), :headers => false)
    csv_out = CSV.new(File.open('new.csv', 'wb'))
    csv.each do |row|
      row[0][0] = ''
      row[0][-1] = ''
      csv_out << row
    end
    csv_out.close
  end

  def self.push_array
    inserts = []
    csv = CSV.new(File.open('new.csv'), :headers => false)
    csv.each do |row| 
      short_url = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
      inserts << "('#{row[0]}', '#{short_url}', '#{Time.now}', '#{Time.now}')"
    end
    sql = "INSERT INTO urls (long_url, short_url, created_at, updated_at) VALUES #{inserts.join(', ')};"
    Url.connection.execute sql
  end
end


LinkImporter.push_array

