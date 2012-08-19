require 'rubygems'
require 'sinatra'
require 'mygengo'

get '/' do
  @name = 'awesome guy'
  mygengo = MyGengo::API.new({
  	:public_key => '5co}B{[1~uyCNwpCy6#N7RV4u)-GW1W9V)FN(li@PW_r9AqM5eOT50jPH8t-=GG]',
  	:private_key => 'A{FohnIPY-|l8L0}b{@-43T|DC3[tb_}9E]t[AJd4X-6bZxT6i5r|BQ7yxCzG$@s',
  	:sandbox => true,
  })

  @stats = mygengo.getAccountStats();
  @gengo = mygengo.methods;
  
  erb :home
end