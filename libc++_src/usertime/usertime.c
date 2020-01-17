#include <stdio.h>
#include <sys/time.h>
#include <time.h>
#include <lua.h>
#include <lauxlib.h>

//秒
static int getsecond(lua_State *L) {
    long now = time(NULL);
    lua_pushnumber(L, now);
    return 1;
}

//微秒
static int getmicrosecond(lua_State *L) {
    struct timeval tv;
    gettimeofday(&tv,NULL);
    long microsecond = tv.tv_sec*1000000+tv.tv_usec;
    lua_pushnumber(L, microsecond);
    return 1;
}

//毫秒
static int getmillisecond(lua_State *L) {
    struct timeval tv;
    gettimeofday(&tv,NULL);
    long millisecond = (tv.tv_sec*1000000+tv.tv_usec)/1000;
    lua_pushnumber(L, millisecond);
    return 1;
}

int luaopen_usertime(lua_State *L) {

    //luaL_checkversion(L);

    luaL_Reg l[] = {
        {"now", getsecond},
        {"now_ms", getmillisecond},
        {"getmicrosecond", getmicrosecond},
        { NULL, NULL },
    };

#if LUA_VERSION_NUM > 501
    luaL_newlib(L, l);
#else
    luaL_register(L, "usertime", l);
#endif   
    //luaL_newlib(L, l);
    return 1;
}

