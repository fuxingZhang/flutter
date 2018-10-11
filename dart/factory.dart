class Logger { 
    final String name; 
    bool mute = false; 
    
    // 变量前加下划线表示私有属性 
    static final Map<String, Logger> _cache = <String, Logger>{}; 
    
    factory Logger(String name) { 
        if (_cache.containsKey(name)) { 
            return _cache[name]; 
        } else { 
            final logger = new Logger._internal(name); 
            _cache[name] = logger; 
            return logger; 
        } 
    }

    Logger._internal(this.name); 
    
    void log(String msg) { 
        if (!mute) { 
            print(msg); 
        } 
    } 
} 

void main() {
  var logger = new Logger('UI'); 
  logger.log('Button clicked');
}