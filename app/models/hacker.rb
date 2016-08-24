require 'rubygems'
require 'mechanize'
class Hacker < ActiveRecord::Base
    def self.hackers_toeic
      
        1.upto(7) do |n|
          1.upto(4) do |l|
            1.upto(4) do |c|
              agent = Mechanize.new
              page = agent.get"http://www.hackers.ac/site/?st=lecture&idx=201&no=2&loc=1&new_level[]=#{n}&lesson_week[]=#{l}&completion_term[]=#{c}"
                list = page.search("td").map(&:text)
                  list.each_slice(7) do |x|
                      link = page.search("td p a")
                			  Hacker.create(
                			              subject: 2,
                			              name: 1,
                			              price: x[3],
                			              link: link['href'],
                			              day:x[1],
                			              time: c,
                			              week: l,
                			              title: x[0],
                			              teacher:x[2],
                			              level: n
                			              )
                  end
                  
             end
           end
        end
    end
    
    def self.hackers_toefl
        

        1.upto(8) do |n|
          1.upto(4) do |l|
            1.upto(4) do |c|
              agent = Mechanize.new
              page = agent.get"http://www.hackers.ac/site/?st=lecture&idx=201&no=#{s}&loc=1&new_level[]=#{n}&lesson_week[]=#{l}&completion_term[]=#{c}"
                list = page.search("td").map(&:text)
                  list.each_slice(7) do |x|
                    link = page.search("td p a")
                      link.map do |y|
                        if x == nil
                        else
                			  Hacker.create(
                			              subject: 1,
                			              name: 1,
                			              price: x[3],
                			              link: y['href'],
                			              day:x[1],
                			              time: c,
                			              week: l,
                			              title: x[0],
                			              teacher:x[2],
                			              level: n
                			              )
                      	end
                      end
                  end    
             end
           end
        end
    end
end