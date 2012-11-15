# encoding: utf-8
require 'optparse'

OPT = OptionParser.new

type,s,g = nil
OPT.on("-t","--type VAL") do |e|
  type = e
end

OPT.on("-s","--s VAL") do |e|
  s = e
end

OPT.on("-g","--s VAL") do |e|
  g = e
end

OPT.parse(ARGV)

if s == nil && g == nil
  puts "Argument error"
  puts "-s [対象文字列] -g [置換後文字列]"
  exit
end


files = Dir.glob("./**/*").select{ |e| type ? e =~ /#{type}/ : true }

files.each do |file|
  print "CHECK: "+file

  if Dir.exist?(file) || file =~ /\.(png|gif|jpg|jpeg|mp3|psd|ai|pdf|sqlite3)/
    print " ...skip\n"
    next
  else
    print "\n"
  end

  output = ""
  open(file,'r') do |io|
    while l = io.gets
      if l =~ /#{s}/ then
        puts "### FILE: "+file+":"+io.pos.to_s
        puts ""
        puts "B: "+l
        puts "----------"
        puts "A: "+l.gsub(/#{s}/,g)
        puts ""
        print "replace?(y/n):"
        rep = STDIN.getc
        while stdinc = STDIN.getc
          break if stdinc == "\n"
        end
        if rep == 'y'
          puts "[[replace...]]"
          output << l.gsub(/#{s}/,g)
        else
          output << l
        end
      else
        output << l
      end # if
    end # while
  end # open
  open(file, 'w') do |io|
    io.write output
  end
end
