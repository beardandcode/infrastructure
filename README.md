Infrastructure for [beardandcode.com](https://beardandcode.com)

# Requirements

  - Vagrant
  - Python/Virtualenv

To setup the remaining dependencies run `tools/setup/install_dependencies.sh`

# Setup development VM

   1. Use the virtualenv set up as part of installing the dependencies

   ```
   $ source venv/bin/activate
   ```

   2. Start and provision development VM

   ```
   $ vagrant up development-1
   ```

   3. Add domain names to /etc/hosts

   ```
   $ sudo sh -c "echo \"192.168.100.10 development.beardandcode.com www.development.beardandcode.com \" >> /etc/hosts"
   ```

# Setup infrastructure

   1. Clean secrets, as these are encrypted using my key, and then setup your own set.

   ```
   $ ./tools/clean.sh && ./tools/setup.sh
   ```

   2. Use Terraform to create the infrastructure. The wrapping shell script is used to inject credentials.

   ```
   $ ./tools/terraform.sh apply
   ```
