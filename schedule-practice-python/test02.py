import sched, time


# class sched.scheduler(timefunc=time.monotonic, delayfunc=time.sleep)¶


s = sched.scheduler(time.time, time.sleep)

def print_time(a='default'):
    print("From print_time", time.time(), a)

# scheduler.enter(delay, priority, action, argument=(), kwargs={})

def print_some_times():
    print(time.time())
    s.enter(10, 1, print_time)
    s.enter(5, 2, print_time, argument=('positional',))
    s.enter(5, 1, print_time, kwargs={'a': 'keyword'})
    s.run()
    print(time.time())

print_some_times()
