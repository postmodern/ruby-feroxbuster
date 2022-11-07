require 'spec_helper'
require 'feroxbuster/command'

describe Feroxbuster::Command do
  describe described_class::StatusCode do
    describe "#initialize" do
      it "must set #range to 100..599 by default" do
        expect(subject.range).to eq(100..599)
      end
    end
  end

  describe described_class::TimeSpec do
    describe "#validate" do
      context "when given nil" do
        let(:value) { nil }

        it "must return [false, \"cannot be nil\"]" do
          expect(subject.validate(value)).to eq(
            [false, "cannot be nil"]
          )
        end
      end

      context "when given a String" do
        context "when given an empty String" do
          let(:value) { "" }

          it "must return [false, \"does not allow an empty value\"]" do
            expect(subject.validate(value)).to eq(
              [false, "does not allow an empty value"]
            )
          end
        end

        context "when given a number" do
          let(:value) { "10" }

          it "must return [false, \"must be a number and end with 'm', 's', 'ms', or 'ns'\"]" do
            expect(subject.validate(value)).to eq(
              [false, "must be a number and end with 'm', 's', 'ms', or 'ns'"]
            )
          end
        end

        context "when given a number that ends with 'ns'" do
          let(:value) { "10ns" }

          it "must return true" do
            expect(subject.validate(value)).to be(true)
          end
        end

        context "when given a number that ends with 'ms'" do
          let(:value) { "10ms" }

          it "must return true" do
            expect(subject.validate(value)).to be(true)
          end
        end

        context "when given a number that ends with 's'" do
          let(:value) { "10s" }

          it "must return true" do
            expect(subject.validate(value)).to be(true)
          end
        end

        context "when given a number that ends with 'm'" do
          let(:value) { "10m" }

          it "must return true" do
            expect(subject.validate(value)).to be(true)
          end
        end

        context "when given a number that ends with an unrecognized unit" do
          let(:value) { "10x" }

          it "must return [false, \"must be a number and end with 'm', 's', 'ms', or 'ns'\"]" do
            expect(subject.validate(value)).to eq(
              [false, "must be a number and end with 'm', 's', 'ms', or 'ns'"]
            )
          end
        end
      end
    end
  end
end
