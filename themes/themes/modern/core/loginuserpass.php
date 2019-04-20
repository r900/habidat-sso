<?php
/**
 * Footer template.
 *
 * The main footer template. This is used throughout the application.
 *
 * @author     Cory Collier <corycollier@corycollier.com>
 * @license    http://opensource.org/licenses/MIT  MIT License
 * @version    git: $Id$
 * @link       https://github.com/corycollier/simplesamlphp-module-themes
 * @see        https://github.com/simplesamlphp/simplesamlphp/
 * @since      File available since Release 1.3.0
 */
?>
<?php
// Variable assignment.
$this->data['header'] = $_ENV["HABIDAT_TITLE"];
$errorcode            = $this->data['errorcode'];
$errorparams          = $this->data['errorparams'];
?>
<?php $this->includeAtTemplateBase('includes/header.php'); ?>

<?php if ($errorcode !== NULL) : ?>
<div class="col-md-12">
  <div class="alert alert-danger" role="alert">
    <h2><?php echo $this->t('{login:error_header}'); ?></h2>
    <p><?php echo htmlspecialchars($this->t('{errors:title_' . $errorcode . '}', $errorparams)); ?></p>
    <p><?php echo htmlspecialchars($this->t('{errors:descr_' . $errorcode . '}', $errorparams)); ?></p>
  </div>
</div>
<?php endif; ?>

<div class="container vertical-align">
    <div class="row ">
        <div class="col-sm-8 col-md-6 col-md-offset-4">
            <div class="account-wall">
                <img class="profile-img" src="/public/habidat.png" alt="">
                <h1 class="text-center login-title"><?php echo  $_ENV["HABIDAT_TITLE"] ?></h1>
                <form class="form-signin" action="?" method="post" name="f">
                <div class="input-group">
                  <span class="first-addon input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                  <input type="text" tabindex="1" name="username" id="username" class="form-control" placeholder="Username" required autofocus 
                <?php if (isset($this->data['username'])) {
                    echo 'value="'.htmlspecialchars($this->data['username']).'"';
                } ?>           
                />
                </div>                
                <div class="input-group last-input">
                  <span class="last-addon input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>                
                  <input type="password" id="password" tabindex="2" name="password" class="form-control" placeholder="Passwort" required />
                </div>
                <button class="btn btn-lg btn-success btn-block" type="submit" tabindex="5">
                    Login</button>
                <label class="checkbox pull-right" style="color:#dddddd;">
                    <input type="checkbox" value="remember-me" >
                    Eingeloggt bleiben
                </label>       
                <span class="pull-left" style="margin-top:10px;"><a style="color:#dddddd;" href="https://user.<?php echo $_ENV['HABIDAT_DOMAIN'] ?>/lostpasswd">Passwort vergessen?</a></span>
                                 <?php foreach ($this->data['stateparams'] as $name => $value) : ?>
          <input type="hidden"
            name="<?php echo htmlspecialchars($name); ?>"
            value="<?php echo htmlspecialchars($value); ?>" />
        <?php endforeach; ?>
                </form>
            </div>
        </div>
    </div>
</div>

<?php $this->includeAtTemplateBase('includes/footer.php'); ?>
