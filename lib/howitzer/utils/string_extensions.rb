module Howitzer
  module Utils
    # This module extends standard String class with useful methods for Cucumber step definitions
    module StringExtensions
      ##
      #
      # Delegates Page.open method. Useful in cucumber step definitions
      #
      # *Parameters:*
      # * +*args+ - Url to be opened
      #

      def open(*args)
        as_page_class.open(*args)
      end

      ##
      #
      # Returns page instance
      #

      def given
        as_page_class.given
      end

      ##
      #
      # Waits until page is opened or raise error
      #

      def displayed?
        as_page_class.displayed?
      end

      ##
      #
      # Returns page class
      #

      def as_page_class
        as_class('Page')
      end

      ##
      #
      # Returns email class
      #

      def as_email_class
        as_class('Email')
      end

      ##
      #
      # Delegate #on to page
      #

      def on(&block)
        as_page_class.on(&block)
      end

      private

      def as_class(type)
        "#{gsub(/\s/, '_').camelize}#{type}".constantize
      end
    end
  end
end
