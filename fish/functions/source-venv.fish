function source-venv
	set cdir $(pwd)
	set result false

	while test $(pwd) != $HOME
		if test -d ".venv"
			source .venv/bin/activate.fish
			set result true
			break
		else
			cd ..
		end
	end

	if $result
		set_color green
		echo "success"
	else
		set_color red
		echo "fail"
	end

	cd $cdir
end
