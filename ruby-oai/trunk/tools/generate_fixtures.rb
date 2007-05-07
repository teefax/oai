#!/usr/bin/env ruby
#
#  Created by William Groppe on 2007-01-17.
require 'yaml'
require 'rubygems'
require 'chronic'

# Dublin Core fields
FIELDS = %w{title creator subject description contributor publisher 
  date type format source language relation coverage rights}

  unless ARGV[0]
    puts "Please specify how many records to generate."
    exit
  end

  # Hash for records
  records = {}

  ARGV[0].to_i.times do |i|
    records[i] = 
    Hash[*FIELDS.collect { |field| 
      # date is a special case--we want a real date in the records
      if field == "date"
        record_date = Chronic.parse("#{i} days ago")
        [field, "#{record_date}"]
      else
        [field, "#{field}_#{i}"]
      end
    } .flatten]
    end

    puts records.to_yaml

