require 'rubygems'
require 'sinatra'
require 'mygengo'

get '/' do
  @gengo = MyGengo::API.new({
  	:public_key => '5co}B{[1~uyCNwpCy6#N7RV4u)-GW1W9V)FN(li@PW_r9AqM5eOT50jPH8t-=GG]',
  	:private_key => 'A{FohnIPY-|l8L0}b{@-43T|DC3[tb_}9E]t[AJd4X-6bZxT6i5r|BQ7yxCzG$@s',
  	:sandbox => true,
  })

  def get_jobs()
    jobs = @gengo.getTranslationJobs()['response']
  end
  
  def get_job(job_entry)
    @gengo.getTranslationJob({:id => job_entry["job_id"]})['response']['job']
  end
  
  @stats = @gengo.getAccountStats()
  @jobs = get_jobs();
  
  erb :home
end

get '/edit' do
  erb :edit
end

post '/form' do
  
  @gengo = MyGengo::API.new({
  	:public_key => '5co}B{[1~uyCNwpCy6#N7RV4u)-GW1W9V)FN(li@PW_r9AqM5eOT50jPH8t-=GG]',
  	:private_key => 'A{FohnIPY-|l8L0}b{@-43T|DC3[tb_}9E]t[AJd4X-6bZxT6i5r|BQ7yxCzG$@s',
  	:sandbox => true,
  })
  
  puts @gengo.postTranslationJob({
    :job => {
      :type => "text",
      :slug => params[:slug],
      :lc_src => params[:lc_src],
      :lc_tgt => params[:lc_tgt],
      :tier => "standard",
      :body_src => params[:body_src]
    }
  })
  
  redirect '/'
end