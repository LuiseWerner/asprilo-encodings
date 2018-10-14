# m-assignments

## About

This is a collection of code to create assignments of robot to shelf in domain M.

## File Dependencies

- **basic file**: Simple.lp includes input.lp
- **use basic file**: all others
- **storage basic file**: Storage.lp
- **use storage basic file**: Storage[somethingElse].lp

## Optimization dependencies

- files with 'Storage' have higher priority for optimization than files without 'Storage'

example: minimize{ D@1 ... } in StorageD.lp, minimize{ D@0 ... } in D.lp