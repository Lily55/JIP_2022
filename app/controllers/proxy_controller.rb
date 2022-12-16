require 'open-uri'
require 'nokogiri'

class ProxyController < ApplicationController
  before_action :parse_params, only: [:show]

  def input; end

  def show
    api_response = URI.open("http://localhost:3000/?format=xml&upper=#{@upper}")

    case @side
    when 'server'
      @result = xslt_transform(api_response).to_html
    when 'client-with-xslt'
      render xml: insert_browser_xslt(api_response).to_xml
    else
      render xml: api_response
    end
  end

  private

  BASE_API_URL = 'http://localhost:3000/?format=xml'.freeze
  XSLT_SERVER_TRANSFORM  = "#{Rails.root}/public/server_transform.xslt".freeze
  XSLT_BROWSER_TRANSFORM = "#{Rails.root}/public/browser_transform.xslt".freeze

  def parse_params
    @upper = params[:upper]
    @side = params[:side]
  end

  def xslt_transform(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: XSLT_BROWSER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet', %(type="text/xsl" href="#{transform}"))
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
