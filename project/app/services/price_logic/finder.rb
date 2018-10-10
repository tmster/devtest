# frozen_string_literal: true

module PriceLogic
  BACKENDS = [Backend::TimesWithA, Backend::TimesNodes, Backend::TenArrays].freeze

  class Finder
    attr_reader :record

    def initialize(record)
      @record = record
    end

    def backend_strategy
      @backend_strategy ||= backends.find(&:applicable?)
    end

    private

    def backends
      BACKENDS.map { |backend| backend.new(record) }
    end
  end
end
