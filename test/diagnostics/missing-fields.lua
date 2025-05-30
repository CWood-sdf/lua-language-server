TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@type A
local t = <!{}!>
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@type A
local t = <!{
    x = 1,
}!>
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@type A
local t = <!{
    x = 1,
    y = 2,
}!>
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@type A
local t = {
    x = 1,
    y = 2,
    z = 3,
}
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number
local A = {}

function A:fun()
end

---@type A
local t = {
    x = 1,
    y = 2,
    z = 3,
}
]]

TEST [[
---@diagnostic disable: unused-local

---@class Parent
---@field a number
local Parent = {}

function Parent:fun2()
end

---@class A : Parent
---@field x number
---@field y? number
---@field z number
local A = {}

function A:fun()
end

---@type A
local t = <!{
    x = 1,
    y = 2,
}!>
]]

TEST [[
---@diagnostic disable: unused-local

---@class Parent
---@field a number
local Parent = {}

function Parent:fun2()
end

---@class A : Parent
---@field x number
---@field y? number
---@field z number
local A = {}

function A:fun()
end

---@type A
local t = {
    x = 1,
    y = 2,
    z = 3,
    a = 1,
}
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number
local A = {}

function A:fun()
end

---@type A
local t = <!{
    x = 1,
    y = 2,
}!>
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@type A
local t = {
    x = 1,
    z = 3,
}
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@param a A
local function f(a) end

f <!{}!>
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@param a A
local function f(a) end

f <!{
    x = 1,
}!>
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@param a A
local function f(a) end

f <!{
    x = 1,
    y = 2,
}!>
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@param a A
local function f(a) end

f {
    x = 1,
    y = 2,
    z = 3,
}
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
---@field y? number
---@field z number

---@param a A
local function f(a) end

f {
    x = 1,
    z = 3,
}
]]

TEST [[
---@diagnostic disable: unused-local
---@class A
---@field x number
local t = {}
]]

TEST [[
---@diagnostic disable: unused-local

---@class A
---@field x number

---@class A
local t = {}
]]

TEST [[
---@diagnostic disable: unused-local

---@class Foo
---@field a number
---@field b number
---@field c number

---@type Foo|Foo[]
local a = {
    {
        a = 1,
        b = 2,
        c = 3,
    }
}
]]

TEST [[
---@diagnostic disable: unused-local

---@class Foo
---@field a number
---@field b number
---@field c number

---@class Bar
---@field ba number
---@field bb number
---@field bc number

---@type Foo|Bar
local b = {
    a = 1,
    b = 2,
    c = 3,
}
]]

TEST [[
---@class A
---@field x integer

---@type A
return <!{}!>
]]

TEST [[
---@class A
---@field x number

---@class B
---@field y number

---@type A|B
local t = <!{
    z = 1,
}!>
]]

TEST [[
---@class A
---@field x number

---@class B
---@field y number

---@type A|B
local t = {
    y = 1,
}
]]

TEST [[
---@diagnostic disable: unused-local

---@class Foo
---@field a number
---@field b number
---@field c number

---@class Foo

---@class Bar
---@field ba number
---@field bb number
---@field bc number

---@class Bar
---@field bd number

---@type Foo|Bar
local x = {
	ba = 1,
	bb = 2,
	bc = 3,
	bd = 4,
}
]]

TEST [[
---@diagnostic disable: unused-local

---@class Foo
---@field a number
---@field b number
---@field c number

---@class Foo

---@class Bar
---@field ba number
---@field bb number
---@field bc number

---@class Bar
---@field bd number

---@type Foo|Bar
local x = {
	a = 1,
	b = 2,
	c = 3,
}
]]

TEST [[
---@diagnostic disable: unused-local

---@class Foo
---@field a number
---@field b number
---@field c number

---@class Foo

---@class Bar
---@field ba number
---@field bb number
---@field bc number

---@class Bar
---@field bd number

---@type Foo|Bar
local x = <!{
	a = 1,
	b = 2,
}!>
]]

TEST [[
---@diagnostic disable: unused-local

---@class Foo
---@field a number
---@field b number
---@field c number

---@class Foo

---@class Bar
---@field ba number
---@field bb number
---@field bc number

---@class Bar
---@field bd number

---@type Foo|Bar
local x = <!{
	ba = 1,
	bb = 2,
	bd = 4,
}!>
]]

TEST [[
---@class A
---@field [1] string
---@field x number

---@type A
local t = {x = 1, ""}
]]

TEST [[
---@class A
---@field [1] string
---@field x number

---@type A
local t = <!{x = 1}!>
]]

-- Inheritance

TEST [[
---@class A
---@field x number

---@class B: A

---@type B
local t = <!{}!>
]]

TEST [[
---@class A
---@field x number
---@field y number

---@class B: A

---@type B
local t = <!{y = 1}!>
]]

TEST [[
---@class A
---@field x number

---@class B: A
---@field y number

---@type B
local t = <!{y = 1}!>
]]

-- Inheritance + optional

TEST [[
---@class A
---@field x? number

---@class B: A

---@type B
local t = {}
]]

TEST [[
---@class A
---@field x? number
---@field y number

---@class B: A

---@type B
local t = {y = 1}
]]

TEST [[
---@class A
---@field x? number

---@class B: A
---@field y number

---@type B
local t = {y = 1}
]]

-- Inheritance + function call

TEST [[
---@class A
---@field x number

---@class B: A

---@param b B
local function f(b) end

f <!{}!>
]]

TEST [[
---@class A
---@field x number
---@field y number

---@class B: A

---@param b B
local function f(b) end

f <!{y = 1}!>
]]

TEST [[
---@class A
---@field x number

---@class B: A
---@field y number

---@param b B
local function f(b) end

f <!{y = 1}!>
]]

-- partial class

TEST [[
---@class A
---@field x number

---@class (partial) B: A

---@type B
local t = {}
]]

TEST [[
---@class A
---@field x number

---@class (partial) B: A
---@field y number

---@type B
local t = <!{}!>
]]

TEST [[
---@class A
---@field x number

---@class (partial) B: A
---@field y number

---@type B
local t = {y = 1}
]]

--
