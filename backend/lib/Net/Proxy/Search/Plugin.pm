package Net::Proxy::Search::Plugin;

use strict;
use Carp;
use LWP::UserAgent;
use URI::Escape;

use constant REGEXP => qr/([a-z0-9.-]+?:\d+)/;

$URI::Escape::escapes{' '} = '+';

sub new
{
	my ($class, $query) = @_;
	
	my $self = {};
	$self->{query} = uri_escape($query);
	$self->{ua} = LWP::UserAgent->new(timeout => 10, agent => 'Mozilla/5.0');
	$self->{links} = [];
	$self->{tmp_links} = [];
	$self->{empty} = 0;
	
	bless $self, $class;
}

sub _empty
{
	$_[0]->{empty} = 1;
	return ();
}

sub empty
{
	$_[0]->{empty};
}

sub next
{
	carp 'not implemented in base class';
}

1;
