class Job 
    attr_reader :lenght, :weight

    def initialize(lenght, weight)
        @lenght = lenght
        @weight = weight
    end

    def to_s
        "Job[lenght = #{@lenght}, weight = #{@weight}]"
    end

    def diff
        @weight-@lenght
    end

    def ratio
        @weight*1.0/@lenght
    end
end

class Schedule
    attr_reader :jobs

    def initialize(jobs)
        @jobs = jobs
    end


    def getSumOfWeightedCompletionTimes
        completionTime = 0
        total = 0
        @jobs.each do |job|
            completionTime += + job.lenght
            total += completionTime * job.weight
        end
        total
    end

    def greedyDiff
        @jobs.sort!{ |job1, job2| [job2.diff, job2.weight] <=> [job1.diff, job1.weight] }
        self
    end

    def greedyRatio
        @jobs.sort!{ |job1, job2| job2.ratio <=> job1.ratio }
        self
    end

    def to_s
        "Schedule#{@jobs.map(&:to_s).to_s}"
    end
end

def testSchedule

    jobs = [Job.new(10, 12), Job.new(2, 4), Job.new(9, 7), Job.new(6, 7), Job.new(9, 10)]
    schedule = Schedule.new(jobs)
    puts "diff: #{schedule.greedyDiff.getSumOfWeightedCompletionTimes}"
    puts "ratio: #{schedule.greedyRatio.getSumOfWeightedCompletionTimes}"

end 

def bookTest
    puts "book test"
    jobs = [Job.new(5, 3), Job.new(2, 1)]
    schedule = Schedule.new(jobs)
    puts "diff: #{schedule.greedyDiff.getSumOfWeightedCompletionTimes}"
    puts "ratio: #{schedule.greedyRatio.getSumOfWeightedCompletionTimes}"
end

def getScheduleFromFile
    puts "getting schedule from file"
    jobs = []
    File.open('jobs_for_scheduling.txt').each_line do |line|
        values = line.split(' ')
        next if values.size == 1
        jobs.push(Job.new(values[1].to_i, values[0].to_i)) 
    end
    Schedule.new(jobs)
end

schedule = getScheduleFromFile
puts "diff: #{schedule.greedyDiff.getSumOfWeightedCompletionTimes}"
puts "ratio: #{schedule.greedyRatio.getSumOfWeightedCompletionTimes}"
