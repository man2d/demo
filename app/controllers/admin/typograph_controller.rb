require 'net/http'
require 'uri'
class Admin::TypographController < ApplicationController
  def typograph
    render :text => process_typograph(params[:text])
  end
  
    protected

    def process_typograph(text)
  #    uri = URI.parse("http://typograf.artlebedev.ru/webservices/typograf.asmx")
  #    request = Net::HTTP::Post.new(uri.request_uri)
      #text = text.gsub (/<[^>]+>/, '');
      #text = text.gsub(/&/, '&amp;')
      #text = text.gsub(/</, '&lt;')
      #text = text.gsub(/>/, '&gt;')

     
     query = '<?xml version="1.0" encoding="UTF-8"?>' +
          '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ' +
          'xmlns:xsd="http://www.w3.org/2001/XMLSchema" ' +
          'xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
                  '<soap:Body>' +
                          '<ProcessText xmlns="http://typograf.artlebedev.ru/webservices/">' +
                            '<entityType>1</entityType>' +
                                  '<text>' + text + '</text>' +
                                  '<useBr>0</useBr>' +
                                  '<useP>0</useP>' +
                          '</ProcessText>' +
                  '</soap:Body>' +
          '</soap:Envelope>'

        http = Net::HTTP.new('typograf.artlebedev.ru', 80)
        path = '/webservices/typograf.asmx'
        @resp, xml_data = http.post(path, query)

      re = /<ProcessTextResult>\s*((.|\n)*?)\s*<\/ProcessTextResult>/m;
      response = xml_data[re];
      
      #response = RegExp.$1;
      response = response.gsub(/&gt;/, '>')
      response = response.gsub(/&lt;/, '<')
      response = response.gsub(/&amp;/, '&')
      response = response.gsub('<ProcessTextResult>', '')
      response = response.gsub('</ProcessTextResult>', '')
logger.info response
      response
      #response
    end
  
end
