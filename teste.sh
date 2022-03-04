data=$(date +'%Y_%m_%d_%H%M')
arquivo="/home/gustavo/logs/$data.log"
echo "Script executado, logs: $arquivo" 
touch "$arquivo" 
wget --server-response -q -o wgetOut  https://shopee.com.br/Testador-de-velocidade-profissional-30-9999-fps-i.484435680.11619827047 # URL_DO_SITE
_wgetHttpCode=`cat wgetOut | gawk '/HTTP/{ print $2 }'`
if [ "$_wgetHttpCode" == "200" ]; then
	echo "PRIMEIRO LINK OK" >> "$arquivo"
	#sleep 10 / 1m / 1h / 1d / sleep 2m 30s
	#echo "SLEEP ACABOU!"
	wget --server-response -q -o wgetOut2 https://sh234opee.com.br/Testador-de-velocidade-profissional-30-9999-fps-i.484435680.11619827047 # URL_DO_SITE
	_wgetHttpCode2=`cat wgetOut2 | gawk '/HTTP/{ print $2 }'`
	if [ "$_wgetHttpCode2" == "200" ]; then
		echo "SEGUNDO LINK OK" < "$arquivo"
		exit 1;
	else
		echo "SEGUNDO LINK ERRO" >> "$arquivo"
		echo "DESCRIÇÃO: `cat wgetOut`" >> "$arquivo"
		exit 1;
	fi
	exit 1;
else
	echo "ERRO PRIMEIRO LINK" >> "$arquivo"
	exit 1;
fi
