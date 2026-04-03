@echo off
set EVOLVER_USE_PARENT_GIT=true
set EVOLVER_ROLLBACK_MODE=stash
set EVOLVE_STRATEGY=repair-only
node "C:\Users\002\.openclaw\workspace\skills\capability-evolver\index.js" run --review
