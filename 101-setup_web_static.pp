# Install Nginx
package { 'nginx':
    ensure => installed,
    provider => 'apt',
}

-> service { 'nginx':
        ensure  => running,
        enable  => true,
}

-> file { '/data':
    ensure  => directory,
    recurse => true,
}
-> file { '/data/web_static':
    ensure  => directory,
}
-> file { '/data/web_static/releases':
    ensure  => directory,
}
-> file { '/data/web_static/shared':
    ensure  => directory,
}
-> file { '/data/web_static/releases/test':
    ensure  => directory,
}
-> file { '/data/web_static/releases/test/index.html':
    ensure  => present,
    content => "Holberton School",
}
-> file { '/data/web_static/current':
    ensure  => link,
    target  => '/data/web_static/releases/test',
    force   => true,
}

-> exec {'change owndership': 
    command => "chown -R ubuntu:ubuntu /data",
    path    => '/bin:/usr/bin:/sbin:/usr/sbin',

}

-> exec {'configure nginx':
    command => 'sed -i "0,/server {/s/server {/server {\n\tlocation \/hbnb_static {\n\t\talias \/data\/web_static\/current;\n\t}/" /etc/nginx/sites-available/default',
    path    => '/bin:/usr/bin:/sbin:/usr/sbin',

}

-> exec {'relod':
    command => 'sudo nginx -s reload',
    path    => '/bin:/usr/bin:/sbin:/usr/sbin',

}
