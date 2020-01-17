print(os.time())
print(os.date())
print(os.date("%x", os.time()))
print(os.date("%X", os.time()))
print(os.date("%c", os.time()))
print(os.date("%Y-%m-%d %H:%M:%S", os.time()))


--函数os.clock返回执行该程序CPU花去的时钟秒数
local x1 = os.clock()
local s = 0
for i = 1, 10000000 do
    s = s + i
end
local x2 = os.clock()
print(string.format("elapsed time: %.2f\n", x2 - x1))


local T2009_StartTime = { year=2013, month=2, day=9, hour=0, min=0, sec=0 }
local T2009_EndTime = { year=2013, month=2, day=17, hour=23, min=59, sec=59 }
print("T2009  ", os.time(T2009_StartTime), os.time(T2009_EndTime))



package.path = "./liblua/?.lua;" .. package.path
package.cpath = "./libc++/?.so;" .. package.cpath
local utime = require "usertime"
local now = utime.now()
local microsecond = utime.getmicrosecond()
local millisecond = utime.now_ms()
print("now", now)
print('microsecond ', microsecond)
print(string.format("microsecond %u", microsecond))
print('millisecond',millisecond)
