 #!/bin/bash

romsFolder=/folder
total_threads=64
cd $romsFolder

modules=( 'thegamesdb' 'esgamelist' 'arcadedb' 'igdb'  'mobygames' 'openretro' 'screenscraper'  'worldofspectrum' )

trap "exit" INT TERM ERR
trap "kill 0" EXIT

function process_console (){
    
    for module in ${modules[@]};do    
        echo $1
        echo Skyscraper -p $1 -s $module -i $romsFolder$1 -g $romsFolder$1 -o $romsFolder$1 -f 'emulationstation' -c $romsFolder/config.ini --onlymissing -t $total_threads
        Skyscraper -p $1 -s $module -i $romsFolder$1 -g $romsFolder$1 -o $romsFolder$ -f 'emulationstation' -c $romsFolder/config.ini --onlymissing -t $total_threads
        
    done
}



 for dir in *;do
    process_console $dir &
done

wait
