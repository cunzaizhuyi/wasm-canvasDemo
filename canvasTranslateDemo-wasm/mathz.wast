(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (result i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func))
  (import "env" "DYNAMICTOP_PTR" (global (;0;) i32))
  (import "env" "tempDoublePtr" (global (;1;) i32))
  (import "env" "ABORT" (global (;2;) i32))
  (import "env" "memoryBase" (global (;3;) i32))
  (import "env" "tableBase" (global (;4;) i32))
  (import "global" "NaN" (global (;5;) f64))
  (import "global" "Infinity" (global (;6;) f64))
  (import "env" "abortStackOverflow" (func (;0;) (type 0)))
  (import "env" "memory" (memory (;0;) 256))
  (import "env" "table" (table (;0;) 0 anyfunc))
  (func (;1;) (type 1) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      get_global 10
      set_local 1
      get_global 10
      get_local 0
      i32.add
      set_global 10
      get_global 10
      i32.const 15
      i32.add
      i32.const -16
      i32.and
      set_global 10
      get_global 10
      get_global 11
      i32.ge_s
      if  ;; label = @2
        get_local 0
        call 0
      end
      get_local 1
      return
      unreachable
    end
    unreachable)
  (func (;2;) (type 2) (result i32)
    get_global 10
    return)
  (func (;3;) (type 0) (param i32)
    get_local 0
    set_global 10)
  (func (;4;) (type 3) (param i32 i32)
    block  ;; label = @1
      get_local 0
      set_global 10
      get_local 1
      set_global 11
    end)
  (func (;5;) (type 3) (param i32 i32)
    get_global 12
    i32.const 0
    i32.eq
    if  ;; label = @1
      get_local 0
      set_global 12
      get_local 1
      set_global 13
    end)
  (func (;6;) (type 2) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      get_global 10
      set_local 3
      get_global 10
      i32.const 16
      i32.add
      set_global 10
      get_global 10
      get_global 11
      i32.ge_s
      if  ;; label = @2
        i32.const 16
        call 0
      end
      i32.const 5
      set_local 1
      get_local 1
      set_local 0
      get_local 3
      set_global 10
      get_local 0
      return
      unreachable
    end
    unreachable)
  (func (;7;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      get_global 10
      set_local 8
      get_global 10
      i32.const 16
      i32.add
      set_global 10
      get_global 10
      get_global 11
      i32.ge_s
      if  ;; label = @2
        i32.const 16
        call 0
      end
      get_local 0
      set_local 6
      get_local 1
      set_local 5
      get_local 6
      set_local 2
      get_local 5
      set_local 3
      get_local 2
      get_local 3
      i32.add
      set_local 4
      get_local 8
      set_global 10
      get_local 4
      return
      unreachable
    end
    unreachable)
  (func (;8;) (type 5)
    (local i32)
    nop)
  (func (;9;) (type 5)
    block  ;; label = @1
      get_global 3
      i32.const 0
      i32.add
      set_global 10
      get_global 10
      i32.const 5242880
      i32.add
      set_global 11
      call 8
    end)
  (global (;7;) (mut i32) (get_global 0))
  (global (;8;) (mut i32) (get_global 1))
  (global (;9;) (mut i32) (get_global 2))
  (global (;10;) (mut i32) (i32.const 0))
  (global (;11;) (mut i32) (i32.const 0))
  (global (;12;) (mut i32) (i32.const 0))
  (global (;13;) (mut i32) (i32.const 0))
  (global (;14;) (mut i32) (i32.const 0))
  (global (;15;) (mut i32) (i32.const 0))
  (global (;16;) (mut f64) (get_global 5))
  (global (;17;) (mut f64) (get_global 6))
  (global (;18;) (mut i32) (i32.const 0))
  (global (;19;) (mut i32) (i32.const 0))
  (global (;20;) (mut i32) (i32.const 0))
  (global (;21;) (mut i32) (i32.const 0))
  (global (;22;) (mut f64) (f64.const 0x0p+0 (;=0;)))
  (global (;23;) (mut i32) (i32.const 0))
  (global (;24;) (mut f32) (f32.const 0x0p+0 (;=0;)))
  (global (;25;) (mut f32) (f32.const 0x0p+0 (;=0;)))
  (export "__post_instantiate" (func 9))
  (export "_addSpeed" (func 7))
  (export "runPostSets" (func 8))
  (export "_speed" (func 6)))
