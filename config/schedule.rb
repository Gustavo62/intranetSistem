# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, 'log/whenever.log'
#
every :day, at: ["10:28 AM"] do
    runner "Intranet::Boleto.geraCobranca"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
  
#every 1.minute  do
#    runner "Intranet::Boleto.geraCobranca"
#end
#every 1.hour  do
#    runner "Intranet::Boleto.atualizaStatusBoleto"
#end

#every 1.hour  do
#    runner "Intranet::Boleto.atualizaSituacaoAssoc"
#end
