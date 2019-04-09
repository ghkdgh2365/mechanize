require 'rubygems'
require 'mechanize'
class Lecture < ActiveRecord::Base
    def self.crawling
        my_page = login #로그인 메소드 호출
        a = my_page.link_with(:href => '/lectures').click
        result_crawling = a.search('.title').map(&:text)
        
        result_crawling.each do |i|
            Lecture.create(title: i)
        end
    end
    
    def self.login
        agent = Mechanize.new 
        page = agent.get('http://class.likelion.net/users/sign_in')
        
        my_page = page.form_with(:action => '/users/sign_in') do |f|
          f.field_with(:name => 'user[email]').value = 'ghkdgh2365@naver.com'
          f.field_with(:name => 'user[password]').value = '00702323'
        end.submit
        
        return my_page
    end

end