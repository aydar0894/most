require 'rails_helper'

RSpec.describe Event, type: :model do

  subject {FactoryBot.build(:event)}
  let(:event_invalid) {FactoryBot.build(:event_invalid)}

  it "is a valid event" do
    expect(subject.valid?).to be true
  end

  it "is a invalid event" do
    expect(event_invalid.valid?).to be false
  end

  it "has title with minimum 6 characters" do
    event = subject.dup
    event.title = 'a' * 6
    expect(event.valid?).to be true
    event.title = 'a' * 5
    expect(event.valid?).to be false
  end

  it "has title with maximum 40 characters" do
    event = subject.dup
    event.title = 'a' * 40
    expect(event.valid?).to be true
    event.title = 'a' * 41
    expect(event.valid?).to be false
  end

  it "finish goes after start" do
    event = subject.dup
    expect(event.valid?).to be true
    event.start = DateTime.current
    event.finish = DateTime.current - 1.day
    expect(event.valid?).to be false
  end

  context "scope tests" do
    it "open to register" do
      events_scoped_count = Event.open_to_register.count
      expected_events_count = Event.where('start > ?', DateTime.current).count
      expect(events_scoped_count).to eq(expected_events_count)
    end

    it "close to register" do
      events_scoped_count = Event.close_to_register.count
      expected_events_count = Event.where('start < ?', DateTime.current).count
      expect(events_scoped_count).to eq(expected_events_count)
    end

    it "currently in progress" do
      events_scoped_count = Event.currently_in_progress.count
      expected_events_count = Event.where('start < ? AND finish > ?', DateTime.current, DateTime.current).count
      expect(events_scoped_count).to eq(expected_events_count)
    end

  end

  it "start_time returns start" do
    expect(subject.start_time).to eq(subject.start)
  end

  it "end_time returns finish" do
    expect(subject.end_time).to eq(subject.finish)
  end
end
