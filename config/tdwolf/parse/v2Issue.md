Using: 
```$ gopherjs build --verbose -m -o $GOPHERFACE_APP_ROOT/static/js/client.min.js

```
I have this error:
```
cannot find package "github.com/tdewolff/parse/v2" in any of:
/usr/local/opt/go/libexec/src/github.com/tdewolff/parse/v2 (from $GOROOT)
/Users/myName/go/src/github.com/tdewolff/parse/v2 (from $GOPATH)
```


I looked up this error and found https://github.com/gopherjs/gopherjs/issues/881


However, the remedy id not working


https://github.com/tdewolff/parse/v2 results in a 404 error

They recommended updating go. So I uninstalled (deleted user/bin/go) and reinstalled.

go version go1.11.5 darwin/amd64

However, I found this, in the github.com/tdewolff/parse/
```
package parse

import (
"fmt"
"io"

"github.com/tdewolff/parse/v2/buffer"
)
```
/Users/myName/go/src/github.com/tdewolff/parse/error.go

Oddly enough I think I found a solution. I decided to remove all "/v2" instances in github.com/tdewolff/parse/


now I have client.min.js.map and client.min.js

So it worked
Of course that took four hours!  

