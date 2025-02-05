---
title: Why we need a log
tags: [ technical, test ]
author: [ Tobias Ziegler, Viktor Leis ]
---

## Intro

Coming to a cloud *near* **you**.

```cpp
struct log {
  constexpr void append(const std::string& message) {
      std::cout << message << std::endl;
  }
};
```

### Subheading 

![btrblocks logo](../../public/img/logo.png)
