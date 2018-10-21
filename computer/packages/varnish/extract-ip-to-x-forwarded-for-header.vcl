vcl 4.0;

set req.http.x-forwarded-for = regsub(req.http.x-forwarded-for, "^(\d+\.\d+\.\d+\.\d+).*", "\1");
