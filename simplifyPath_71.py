# Solution for leetcode.com problem #71
# https://leetcode.com/problems/simplify-path/

def simplifyPath(path: str) -> str:
    assert len(path) > 0 and path[0] == '/'

    pathstack = []
    i = 0
    while True:
        assert i == len(path) or path[i] == '/'
        while i < len(path) and path[i] == '/':
            i += 1
        if i == len(path):
            break

        if path[i:i+2] == '.' or path[i:i+2] == './':
            i += 1
        elif path[i:i+3] == '..' or path[i:i+3] == '../':
            if len(pathstack) > 0:
                pathstack.pop()
            i += 2
        else:
            namestart = i
            while i < len(path) and path[i] != '/':
                i += 1
            pathstack.append(path[namestart:i])

    out = "/"
    i = 0
    while i < len(pathstack):
        out = out + pathstack[i]
        if i != len(pathstack) - 1:
            out = out + "/"
        i += 1

    return out

assert simplifyPath('/') == '/'
assert simplifyPath('//') == '/'
assert simplifyPath('///') == '/'

assert simplifyPath('/abc') == '/abc'
assert simplifyPath('/abc/') == '/abc'
assert simplifyPath('/abc//') == '/abc'
assert simplifyPath('/abc///') == '/abc'
assert simplifyPath('//abc') == '/abc'
assert simplifyPath('//abc/') == '/abc'
assert simplifyPath('//abc//') == '/abc'
assert simplifyPath('//abc///') == '/abc'
assert simplifyPath('///abc') == '/abc'
assert simplifyPath('///abc/') == '/abc'
assert simplifyPath('///abc//') == '/abc'
assert simplifyPath('///abc///') == '/abc'

assert simplifyPath("/abc//def/") == '/abc/def'
assert simplifyPath("//../bar/../bar/.././bar///bar/foo//./bar/qux/baz/qux/baz") == "/bar/bar/foo/bar/qux/baz/qux/baz"
assert simplifyPath("/..bar/./....qux/.../") == "/..bar/....qux/..."
assert simplifyPath('/./') == '/'
assert simplifyPath('/../') == '/'
