# -*- coding: utf-8 -*-
module ApplicationHelper
  def plaintext_summary(text, length: 280)
    doc = Nokogiri::HTML::DocumentFragment.parse(text)
    simple_format(truncate(doc.css('p').map(&:text).join('').to_s, :length => length))
  end
end
