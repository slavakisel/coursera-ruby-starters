num_workers, m = gets.split(' ').map(&:to_i)
jobs = gets.split(' ').map(&:to_i)

# TODO: replace this code with a faster algorithm.
assigned_worker = Array.new(jobs.size, 0)
start_time = Array.new(jobs.size, 0)
next_free_time = Array.new(num_workers, 0)

for i in 0...jobs.size
  duration = jobs[i]
  best_worker = 0

  for j in 0...num_workers
    if next_free_time[j] < next_free_time[best_worker]
      best_worker = j
    end
  end

  assigned_worker[i] = best_worker
  start_time[i] = next_free_time[best_worker]
  next_free_time[best_worker] = next_free_time[best_worker] + duration
end
# END TODO

for i in 0...jobs.size
  puts "#{assigned_worker[i]} #{start_time[i]}"
end
